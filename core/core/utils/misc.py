import yaml

def yaml_coerce(value):
    """
    :param value: value to coerce
    :return: coerced value
    """
    if isinstance(value, str):
       return yaml.load(f' {value}', Loader=yaml.SafeLoader)['dummy']
    return value