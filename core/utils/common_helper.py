"""Module helper for the project"""
import json
import re
import string
from random import choices

import yaml

from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import RequestManager
from definitions import ENV_YML
from definitions import STORED_ID

CONFIG_DATA = yaml.load(open(ENV_YML))
LOGGER = SingletonLogger().get_logger()


class CommonHelper:
    """Class Common Helper"""

    def __init__(self):
        """Utility class"""

    @staticmethod
    def read_endpoint(endpoint):
        """
        This method read a general endpoint.
        :param endpoint: Input endpoint with brackets
        :return: Decoded endpoint
        """
        if not re.search('{(.+?)}', endpoint):
            return endpoint
        read = re.findall('{(.+?)}', endpoint)
        result = endpoint
        for item in read:
            result = re.sub('{(%s)}' % item, str(STORED_ID[item]), result)
        return result

    @staticmethod
    def get_account_id():
        """
        Static method for read and account from environment.yml
        """
        STORED_ID["account_id"] = CONFIG_DATA['account_id']
        STORED_ID["member_id"] = CONFIG_DATA['member_id']

    @staticmethod
    def add_member():
        """
        Static method for add a member.
        """
        client = RequestManager()
        client.set_method("POST")
        client.set_endpoint("/accounts/{0}/memberships".format(CONFIG_DATA['account_id']))
        body = {"person_id": CONFIG_DATA['member_id']}
        client.set_body(json.dumps(body))
        client.execute_request()

    @staticmethod
    def delete_member():
        """
        Static method for delete a member.
        """
        client = RequestManager()
        client.set_method("DELETE")
        client.set_endpoint("/accounts/{0}/memberships/{1}".format(CONFIG_DATA['account_id'], CONFIG_DATA['member_id']))
        client.execute_request()

    @staticmethod
    def create_epic():
        """
        Static method for create a epic in to a project.
        """
        client = RequestManager()
        client.set_method("POST")
        client.set_endpoint("/projects/{0}/epics".format(STORED_ID['project_id']))
        name = "".join(choices(string.ascii_letters, k=6))
        body = {"name": name}
        client.set_body(json.dumps(body))
        response = client.execute_request()
        STORED_ID['epic_id'] = response.json()['id']

    @staticmethod
    def create_story():
        """
        Static method for create a story in to a project.
        """
        client = RequestManager()
        client.set_method("POST")
        client.set_endpoint("/projects/{0}/stories".format(STORED_ID['project_id']))
        name = "".join(choices(string.ascii_letters, k=6))
        body = {"name": name}
        client.set_body(json.dumps(body))
        response = client.execute_request()
        try:
            STORED_ID['story_id'] = response.json()['id']
        except KeyError:
            LOGGER.info(response.json())

    @staticmethod
    def create_task():
        """
        Static method for create a task in a story in to a project.
        """
        client = RequestManager()
        client.set_method("POST")
        client.set_endpoint("/projects/{0}/stories/{1}/tasks".format(STORED_ID['project_id'], STORED_ID['story_id']))
        name = "".join(choices(string.ascii_letters, k=6))
        body = {"description": name}
        client.set_body(json.dumps(body))
        response = client.execute_request()
        try:
            STORED_ID['task_id'] = response.json()['id']
        except KeyError:
            LOGGER.info(response.json())

    @staticmethod
    def create_webhooks():
        """
        Static method for create a webhooks in to a project.
        """
        client = RequestManager()
        client.set_method("POST")
        client.set_endpoint("/projects/{0}/webhooks".format(STORED_ID['project_id']))
        name = "".join(choices(string.ascii_letters, k=6))
        body = {"webhook_url": 'https://' + name, "webhook_version": 'v5'}
        client.set_body(json.dumps(body))
        response = client.execute_request()
        try:
            STORED_ID['id'] = response.json()['id']
        except KeyError:
            LOGGER.info(response.json())
