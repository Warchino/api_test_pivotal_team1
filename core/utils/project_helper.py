"""Helper for projects of pivotal tracker"""
import json
import string
from random import choices

from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import RequestManager
from definitions import STORED_ID

LOGGER = SingletonLogger().get_logger()


class ProjectHelper:
    """Project helper class"""

    def __init__(self):
        """Utility class"""

    @staticmethod
    def create_project():
        """
        This method create a project in pivotal tracker
        """
        client = RequestManager()
        project_name = "".join(choices(string.ascii_letters + string.digits, k=10))
        client.set_method("POST")
        client.set_endpoint("/projects")
        body = {"name": project_name}
        client.set_body(json.dumps(body))
        response = client.execute_request()
        STORED_ID['project_id'] = response.json()['id']

    @staticmethod
    def delete_project(project_id):
        """
        Static method for delete a project.
        """
        client = RequestManager()
        client.set_method("DELETE")
        client.set_endpoint("/projects/{0}".format(project_id))
        client.execute_request()

    @staticmethod
    def delete_all_projects():
        """
        Static method for delete all projects.
        """
        client = RequestManager()
        client.set_method("GET")
        client.set_endpoint("/projects")
        response = client.execute_request()
        for project in response.json():
            try:
                ProjectHelper.delete_project(project["id"])
            except TypeError:
                LOGGER.info(project)

    @staticmethod
    def read_project(response):
        """
        Static method who read all projects
        :param response: Request response
        """
        STORED_ID['project_id'] = response.json()["id"]

    @staticmethod
    def delete_stored_project():
        """
        Static method for delete a project.
        """
        client = RequestManager()
        client.set_method("DELETE")
        client.set_endpoint("/projects/{0}".format(STORED_ID['project_id']))
        client.execute_request()
