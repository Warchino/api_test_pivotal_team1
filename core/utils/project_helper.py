"""Helper for projects of pivotal tracker"""
import json
from random import choices
import string

from definitions import STORED_ID
from core.rest_client.request_manager import RequestManager


class ProjectHelper(object):
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
