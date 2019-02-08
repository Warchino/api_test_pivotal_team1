"""Module of epics steps"""
import json

from behave import step, use_step_matcher
from compare import expect

use_step_matcher("re")

from core.logger.singleton_logger import SingletonLogger

LOGGER = SingletonLogger().get_logger()


@step("I verify the sent data of epics")
def verify_sentdata_epics(context):
    """
    Verification of the sent data
    """
    LOGGER.info("Validation of sent data of epics")
    sent_json = json.loads(context.sent_data)
    response = context.response.json()
    for item in sent_json:
        if item == "label":
            expect(sent_json[item]['name']).to_equal(response["label"]["name"])
        else:
            expect(sent_json[item]).to_equal(response[item])
