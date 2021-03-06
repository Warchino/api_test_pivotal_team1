"""Module of Common steps"""
import json
import re

from behave import step, then
from compare import expect
from jsonschema import validate

from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import RequestManager
from core.utils.common_helper import CommonHelper
from definitions import ERROR_DICT, AUX_LIST
from definitions import SCHEMA_PIVOTAL, STORY_STATE

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


@step(u'I set up the params')
def set_up_body_params(context):
    """
    Setting the data.
    :param context: Input context.
    """
    LOGGER.info("Add Data to request")
    context.sent_data = context.text
    body = json.loads(context.sent_data)
    if "limit" in body:
        AUX_LIST.append(body.get("limit"))
    if "offset" in body:
        AUX_LIST.append(body.get("offset"))
    if "current_state" in body:
        STORY_STATE.append(body.get("current_state"))
    context.client.set_body(json.dumps(body))


@step(u'I compare states of transitions')
def set_up(context):
    """
    Setting the data.
    :param context: Input context.
    """
    for count, value in enumerate(STORY_STATE):
        expect(value).to_equal(context.response.json()[count].get('state'))
    STORY_STATE.clear()


@step(u'I compare states of limited transitions')
def compare_limited_transitions(context):
    """
    Setting the data.
    :param context: Input context.
    """
    for count, value in enumerate(context.response.json()):
        expect(value.get('state')).to_equal(STORY_STATE[count])
    STORY_STATE.clear()


@step(u'I compare quantity transitions')
def compare_quantity(context):
    """
    Send the request.
    :param context: Input context.
    """
    expect(len(STORY_STATE)).to_equal(len(context.response.json()))


@step(u'I compare {limit} with transitions')
def compare_quantity_limited(context, limit):
    """
    Send the request.
    :param context: Input context.
    """
    expect(int(limit)).to_equal(len(context.response.json()))


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
        elif item in response:
            expect(sent_json[item]).to_equal(response[item])
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


@step("I verify all the stories with the schema")
def verify_all_stories(context):
    """
    Verification of all stories.
    """
    LOGGER.info("Validation of stories by an schema")
    with open(SCHEMA_PIVOTAL["Story"]) as schema_creation:
        schema = json.load(schema_creation)
    for story in context.response.json():
        validate(instance=story, schema=schema)


@step("I verify the sent data of membership")
def validation_sent_data_membership(context):
    """
    Verification of the sent data of membership of project.
    :param context: Input context.
    """
    LOGGER.info("Validation of sent data of membership ")
    sent_json = json.loads(context.sent_data)
    response = context.response.json()
    for item in sent_json:
        if item == "role":
            expect(sent_json[item]).to_equal(response[item])
        else:
            expect(sent_json[item]).to_equal(response["person"]["id"] if item == "person_id"
                                             else response["person"][item])


@step("I verify the sent data of membership by email")
def val_data_membership_email(context):
    """
    Verification of the sent data of membership of project.
    :param context: Input context.
    """
    LOGGER.info("Validation of sent data of membership ")
    sent_json = json.loads(context.sent_data)
    response = context.response.json()

    for item in sent_json:
        if item == "role":
            expect(sent_json[item]).to_equal(response[item])
        elif item == "email":
            expect(sent_json[item]).to_equal(response["person"]["email"])
        else:
            expect(sent_json[item]).to_equal(response["person"][item])


@step("I verify the sent data url")
def validation_sent_data_url(context):
    """
    Verification of the sent data.
    :param context: Input context.
    """
    LOGGER.info("Validation of sent data")
    sent_json = json.loads(context.sent_data)
    response = context.response.json()
    for item in sent_json:
        if 'https://' not in sent_json['webhook_url']:
            sent_json['webhook_url'] = 'https://' + sent_json['webhook_url']
        expect(sent_json[item]).to_equal(response[item])


@step('I validate the "{message}" error')
def step_impl(context, message):
    """
    Validation of error message
    """
    response = context.response.json()
    if not re.search(ERROR_DICT[message], response['general_problem']):
        raise AssertionError


@step('I validate the "{message}" error by requirement')
def step_impl_by_requirement(context, message):
    """
    Validation of error message
    """
    response = context.response.json()
    if not re.search(ERROR_DICT[message], response['requirement']):
        raise AssertionError
