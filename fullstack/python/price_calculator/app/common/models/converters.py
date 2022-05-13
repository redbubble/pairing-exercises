from typing import Any, Callable, List, TypeVar, Iterable

T = TypeVar('T')


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_dict(x: Any) -> dict:
    assert isinstance(x, dict)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, Iterable)
    return [f(y) for y in x]
