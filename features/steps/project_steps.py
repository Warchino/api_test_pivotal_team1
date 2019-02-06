"""Module of steps for project"""
import json

from behave import step

from core.logger.singleton_logger import SingletonLogger

LOGGER = SingletonLogger().get_logger()


@step("I set up the header")
def set_up_header(context):
    """
    Step for set the header of the request.
    :param context: Input context.
    """
    LOGGER.info("Add Headers to request")
    header = json.loads(context.text)
    data = context.client.get_headers()
    for key in header.keys():
        data[key] = header[key]
    context.client.set_headers(data)


@step("I validate the date data of project history")
def validate_date_data(context):
    """
    Step for verify the data of the request.
    """
    response = context.response.json()
    information = response['data']
    for data_array in information:
        for data in data_array:
            if not isinstance(data, str) and not isinstance(data, int) and not isinstance(data, float):
                raise AssertionError
