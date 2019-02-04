"""Module for do request"""
import requests
import yaml

from definitions import ENV_YML

CONFIG_DATA = yaml.load(open(ENV_YML))


class RequestManager(object):
    """Class that performs API requests."""

    def __init__(self):
        self.method = ''
        self.endpoint = ''
        self.headers = {
            "X-TrackerToken": CONFIG_DATA['token'],
            "Content-Type": "application/json"
        }
        self.body = {}
        self.parameters = {}
        self.base_url = CONFIG_DATA['api_url']
        self.authentication = (CONFIG_DATA['user'], CONFIG_DATA['pass'])

    def set_headers(self, headers):
        """
        Setter of header
        :param headers: Input header
        """
        self.headers = headers

    def set_parameters(self, parameters):
        """
        Setter of header
        :param parameters: Input parameters
        """
        self.parameters = parameters

    def set_body(self, body):
        """
        Setter of body
        :param body: Body
        """
        self.body = body

    def set_base_url(self, base_url):
        """
        Setter of base url
        :param base_url: base url
        """
        self.base_url = base_url

    def set_method(self, method):
        """
        Setter of method
        :param method: Method
        """
        self.method = method

    def set_endpoint(self, endpoint):
        """
        Setter of endpoint
        :param endpoint: Endpoint
        """
        self.endpoint = endpoint

    def get_body(self):
        """
        Getter of the body
        :return: Body
        """
        return self.body

    def get_headers(self):
        """
        Getter of the headers
        :return: Headers.
        """
        return self.headers

    def get_parameters(self):
        """
        Getter of parameters
        :return: Parameters
        """
        return self.parameters

    def get_base_url(self):
        """
        Getter of the base url
        :return: Base url
        """
        return self.base_url

    def get_method(self):
        """
        Getter of method
        :return: Method
        """
        return self.method

    def get_endpoint(self):
        """
        Getter of endpoint
        :return: Endpoint
        """
        return self.endpoint

    def build_url(self):
        """
        Build url.
        :return: Builder url.
        """
        return "{}{}".format(self.base_url, self.endpoint)

    def execute_request(self):
        """
        Performs an API request.
        """
        uri = self.build_url()
        dispatch = {
            'GET': requests.get(uri, headers=self.headers, auth=self.authentication),
            'POST': requests.post(uri, headers=self.headers, auth=self.authentication, data=self.get_body()),
            'PUT': requests.put(uri, headers=self.headers, data=self.get_body()),
            'DELETE': requests.delete(uri, headers=self.headers)
        }
        return dispatch[self.method]
