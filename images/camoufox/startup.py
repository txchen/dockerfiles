from camoufox.server import launch_server

launch_server(
    headless="virtual",
    geoip=True,
    port=11111,
    ws_path='camou',
    persistent_context=True,
    user_data_dir='/data',
)