if IN_DOCKER: # type: ignore # noqa
    print('In Docker mode......')
    assert MIDDLEWARE[:1]==[ # type: ignore # noqa
                               'django.middleware.security.SecurityMiddleware']