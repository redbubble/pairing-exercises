from unittest.mock import Mock, call

import pytest

from app.common.models.converters import from_dict, from_int, from_str, from_list


@pytest.mark.parametrize(
    argnames='test_input,expected',
    argvalues=[
        (x, x)
        for x in range(-10, 10)
    ]
)
def test_from_int_with_valid_inputs(test_input, expected):
    assert from_int(test_input) == expected


@pytest.mark.parametrize(
    argnames='test_input',
    argvalues=[None, True, False, 'random string', '9', '-19']
)
def test_from_int_with_invalid_inputs(test_input):
    with pytest.raises(AssertionError):
        from_int(test_input)


@pytest.mark.parametrize(
    argnames='test_input',
    argvalues=['Hello', 'from', '', ' ', ' the', 'other ', 'side!']
)
def test_from_str_with_valid_inputs(test_input):
    assert from_str(test_input) == test_input


@pytest.mark.parametrize(
    argnames='test_input',
    argvalues=[None, True, False, 0, 1, 9e+10]
)
def test_from_str_with_invalid_inputs(test_input):
    with pytest.raises(AssertionError):
        from_str(test_input)


def test_from_dict_with_valid_inputs():
    test_input = {
        'alpha': 1,
        'beta': 2,
        'gamma': 3,
        'delta': '10',
    }
    assert from_dict(test_input) == test_input


@pytest.mark.parametrize(
    argnames='test_input',
    argvalues=[None, True, False, 'random string', '9', '-19']
)
def test_from_dict_with_invalid_inputs(test_input):
    with pytest.raises(AssertionError):
        from_dict(test_input)


def test_from_list_with_valid_inputs():
    test_input = [None, True, False, 'random string', '9', '-19']
    input_fn = Mock(wraps=lambda x: x)

    assert from_list(input_fn, test_input) == test_input
    input_fn.assert_has_calls([
        call(x)
        for x in test_input
    ])
