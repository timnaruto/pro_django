def deep_update(base_dict, new_dict):
    """
    Update a nested dictionary or similar mapping.
    Modify ``base_dict`` in place.
    """
    for key, value in new_dict.items():
        if isinstance(value, dict):
            base_dict_value = base_dict.get(key)
            if isinstance(base_dict_value, dict):
                deep_update(base_dict_value, value)
            else:
                base_dict[key] = value
        else:
            base_dict[key] = value
    return base_dict