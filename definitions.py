"""Module for set some definitions and root dir"""
import os

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
ENV_YML = os.path.join(ROOT_DIR, 'environment.yml')

SCHEMA_PIVOTAL = {
    'Account': os.path.join(ROOT_DIR, 'team_one_behave/schemas/pivotal_tracker/account.schema.json'),
    'Project': os.path.join(ROOT_DIR, 'team_one_behave/schemas/pivotal_tracker/project.schema.json'),
    'Projects': os.path.join(ROOT_DIR, 'team_one_behave/schemas/pivotal_tracker/projects.schema.json')
}
SCHEMA_TODOLY = {
    'Creation': os.path.join(ROOT_DIR, 'team_one_behave/schemas/projectcreation.schema.todoly.json')
}

STORED_ID = {}
