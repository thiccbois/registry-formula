def test_file_exists(host):
    registry = host.file('/registry.yml')
    assert registry.exists
    assert registry.contains('your')

# def test_registry_is_installed(host):
#     registry = host.package('registry')
#     assert registry.is_installed
#
#
# def test_user_and_group_exist(host):
#     user = host.user('registry')
#     assert user.group == 'registry'
#     assert user.home == '/var/lib/registry'
#
#
# def test_service_is_running_and_enabled(host):
#     registry = host.service('registry')
#     assert registry.is_enabled
#     assert registry.is_running
