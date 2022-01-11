from pathlib import Path

import pytest

from app.common.utils import read_json


@pytest.mark.parametrize(
    argnames='json_file',
    argvalues=[
        None,
        '',
        '/ghost/file/',
        Path(__file__).parents[1] / 'data' / 'empty_file',
        Path(__file__).parents[1] / 'data' / 'empty_json.json',
    ]
)
def test_read_json_with_error(json_file):
    assert not list(read_json(json_file))
