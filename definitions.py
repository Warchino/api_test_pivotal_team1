"""Module for set some definitions and root dir"""
import os

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
ENV_YML = os.path.join(ROOT_DIR, 'environment.yml')

SCHEMA_PIVOTAL = {
    'Account': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/account.schema.json'),
    'Accounts': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/accounts.schema.json'),
    'Accounts_summary': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/accounts_summary.schema.json'),
    'Memberships_account': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/memberships_account.schema.json'),
    'Members': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/members.schema.json'),
    'Project': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/project.schema.json'),
    'Projects': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/projects.schema.json'),
    'Epics': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/epics.schema.json'),
    'Epics-Creation': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/epics.creation.schema.json'),
    'Epic': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/epic.schema.json'),
    'Webhooks': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/webhooks.schema.json'),
    'Webhooks-Creation': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/webhooks.creation.schema.json'),
    'Project-Integrations': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/projects.schema.json'),
    'Story': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/story.schema.json'),
    'Project-History': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/project_history.schema.json'),
    'Tasks': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/tasks.schema.json'),
    'Task': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/task.schema.json'),
    'Story-Transitions': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/story_transitions.schema.json'),
    'Project-Memberships': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/project_membership.schema.json'),
    'Project-Memberships-Creation': os.path.join(ROOT_DIR,
                                                 'schemas/pivotal_tracker/project_memberships_creation.schema.json'),
    'Error': os.path.join(ROOT_DIR, 'schemas/pivotal_tracker/error_schema/error.schema.json')
}
SCHEMA_TODOLY = {
    'Creation': os.path.join(ROOT_DIR, 'schemas/todoly/projectcreation.schema.todoly.json')
}

ERROR_DICT = {
    "Long-extended_string": "^This extended_string is too long: .+?$",
    "Long-string": "^This string is too long: .+?$",
    "Should_be-extended_string": "'(.+?)' must be an extended_string",
    "Should_be-string": "'(.+?)' must be an string",
    "At_least-one": "^this endpoint requires at least one of the following parameters:.+?$",
    "Blank": "can't be blank",
    "Must_be-one": "'(.+?)' must be one of: .+?",
    "Must_be-integer": "'(.+?)' must be an integer value",
    "Null-point": "Projects require a point scale., This is not a valid custom point scale.",
    "Invalid-point": "This is not a valid custom point scale.",
    "Over-point": "You can't have point values above 999",
    "Duplicate-point": "You can't have duplicate point values",
    "ISO-date": "must be a date value represented as iso 8601 date",
    "Blank-label": "Please enter a name for the label.",
    "Nonexistent-label": "Label with id=\d+ does not exist within this project",
    "Cant_move": "This epic can no longer be moved to that position"
}

STORED_ID = {}
