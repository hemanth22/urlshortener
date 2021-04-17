#!/bin/bash
gunicorn "urlshort:create_app()" -b 0.0.0.0
