"""Module of steps for project"""
import json

from behave import step
from compare import expect

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


@step("I verify the sent project data")
def verify_data_project(context):
    """
    Verification of the sent data of the project
    """
    LOGGER.info("Validation of sent data of project")
    sent_json = json.loads(context.sent_data)
    response = context.response.json()
    for item in sent_json:
        if item == "time_zone":
            if 'olson_name' in sent_json[item]:
                expect(sent_json[item]['olson_name']).to_equal(response["time_zone"]["olson_name"])
            if 'offset' in sent_json[item]:
                expect(sent_json[item]['offset']).to_equal(response["time_zone"]["offset"])
        else:
            expect(sent_json[item]).to_equal(response[item])
