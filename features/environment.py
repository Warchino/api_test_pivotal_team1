"""Module for set the environment of behave"""
from core.utils.common_helper import CommonHelper
from core.utils.project_helper import ProjectHelper


def before_scenario(context, scenario):
    """
    Method who run before the scenario.
    :param scenario: Input scenario.
    """
    if 'post_membership_account' in scenario.tags:
        CommonHelper.add_member()

    if 'create_project' in scenario.tags:
        ProjectHelper.create_project()

    if 'read_account' in scenario.tags:
        CommonHelper.get_account_id()

    if 'create_epic' in scenario.tags:
        CommonHelper.create_epic()

    if 'create_story' in scenario.tags:
        CommonHelper.create_story()


def after_scenario(context, scenario):
    """
    Method who run after the scenario.
    :param scenario: Input scenario.
    """
    if 'delete_data' in scenario.tags:
        CommonHelper.delete_member()


def after_all(context):
    """
    Method who run after all features.
    :param context: Input context.
    """
    ProjectHelper.delete_all_projects()
