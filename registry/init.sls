{% from 'registry/map.jinja' import config with context %}


#
# config file
#
/etc/registry/config.yml:
  file.managed:
    - mode: 644
    - makedirs: True
    - source: salt://abridge/files/slackbot_settings.py
    - template: jinja
    - contents: |-
      {{ config.settings }}

#
# Docker image present
#
{{ config.docker.image }}-image:
  docker_image.present:
    - tag: {{ config.docker.tag }}

#
# Docker container
#
{{ config.docker.image }}-container-running:
  docker_container.running:
    - name: {{ config.docker.name }}
    - image: '{{ config.docker.image }}:{{ config.docker.tag }}'
    - port_bindings: {{ config.docker.ports }}
    - environment: {{ config.env }}
    - binds: {{ config.docker.binds }}
    - watch:
        - {{ config.docker.image }}-image