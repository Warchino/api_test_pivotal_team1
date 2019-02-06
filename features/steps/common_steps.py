"""Module of Common steps"""
import json

from behave import step, then
from compare import expect
from jsonschema import validate

from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import RequestManager
from core.utils.common_helper import CommonHelper
from definitions import SCHEMA_PIVOTAL

LOGGER = SingletonLogger().get_logger()


@step(u'I set up a "{method}" request to "{endpoint}" endpoint')
def set_up_request_to_endpoint(context, method, endpoint):
    """
    Set up a request to an endpoint.
    :param context: Input context.
    :param method: Input method.
    :param endpoint: Input endpoint.
    """
    LOGGER.info("Make the call")
    client = RequestManager()
    client.set_method(method)
    client.set_endpoint(CommonHelper.read_endpoint(endpoint))
    context.client = client


@then(u'I get a "{status_code}" status code as response')
def get_status_code(context, status_code):
    """
    Verification of status code
    :param context: Input context.
    :param status_code: Input status code.
    """
    LOGGER.info("Validation Status Code")
    expect(int(status_code)).to_equal(context.response.status_code)


@step(u'I send the request')
def send_request(context):
    """
    Send the request.
    :param context: Input context.
    """
    LOGGER.info("Execute request")
    context.response = context.client.execute_request()


@step(u'I set up the data')
def set_up_body(context):
    """
    Setting the data.
    :param context: Input context.
    """
    LOGGER.info("Add Data to request")
    context.sent_data = context.text
    body = json.loads(context.sent_data)
    context.client.set_body(json.dumps(body))


@step(u'I validate with "{read_schema}" schema')
def schema_validation(context, read_schema):
    """
    Schema validation.
    :param read_schema: Input schema
    :param context: Input context.
    """
    LOGGER.info("Validation of the schema")
    with open(SCHEMA_PIVOTAL[read_schema]) as schema_creation:
        schema = json.load(schema_creation)
    validate(instance=context.response.json(), schema=schema)


@step("I verify the sent data")
def validation_sent_data(context):
    """
    Verification of the sent data.
    :param context: Input context.
    """
    LOGGER.info("Validation of sent data")
    sent_json = json.loads(context.sent_data)
    for item in sent_json:
        response = context.response.json()
        expect(sent_json[item]).to_equal(response[item])


@step("I verify the sent data of member")
def validation_sent_data_member(context):
    """
    Verification of the sent data of member.
    :param context: Input context.
    """
    LOGGER.info("Validation of sent data of member")
    sent_json = json.loads(context.sent_data)
    for item in sent_json:
        response = context.response.json()
        if item == "person_id":
            expect(sent_json[item]).to_equal(response["person"]["id"])
        else:
            expect(sent_json[item]).to_equal(response["person"][item])


@step("I verify if the project was deleted")
def verify_deleted_project(context):
    """
    Verification if was deleted
    """
    LOGGER.info("Validation of delete project")
    context.client.set_method('GET')
    response = context.client.execute_request()
    expect(403).to_equal(response.status_code)


@step(u'I verify if epic was deleted')
def verify_deletion(context):
    """
    Verification if the resources was deleted
    """
    LOGGER.info("Validation of delete resource")
    context.client.set_method('GET')
    response = context.client.execute_request()
    expect(404).to_equal(response.status_code)


@step("I verify the sent labels")
def validation_label(context):
    """
    Verification of the sent label.
    :param context: Input context.
    """
    LOGGER.info("Validation of sent labels")
    sent_json = json.loads(context.sent_data)
    for item in sent_json:
        count = 0
        for child in sent_json[item]:
            response = context.response.json()
            expect(child['name']).to_equal(response[item][count]['name'])
            count += 1


@step(u'I verify if item was deleted')
def verify_item_deleted(context):
    """
    Verification if the resources was deleted
    """
    LOGGER.info("Validation of delete resource")
    context.client.set_method('GET')
    response = context.client.execute_request()
    expect(404).to_equal(response.status_code)
