LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'standard': {
            'format': '%(asctime)s [%(levelname)s] %(name)s: %(message)s'
        },
    },
    'handlers': {
        'console': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
            'filters': [],
            'formatter': 'standard',
        },
    },
    'loggers': {
        logger_name: {
            'level': 'WARNING',
            'propagate': True,
        } for logger_name in (
            'django',
            'django.request',
            'django.server',
            'django.db.backends',
            'django.security',
            'django.template',
            'django.utils',
            'django.db',
            'django.db.backends',
            'core',
        )
    },
    'root': {
        'level': 'DEBUG',
        'handlers': ['console']

    },

}
