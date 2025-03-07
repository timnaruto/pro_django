from core.core.utils.settings import get_settings_from_env
from core.core.utils.custom_collections import deep_update

deep_update(globals(), get_settings_from_env(ENVVAR_SETTINGS_PREFIX)) # noqa

# export CORESETTINGS_IN_DOCKER=True (environment variable)