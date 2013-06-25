ADMIN_CREDENTIALS = YAML.load_file(Rails.root.join('config', 'admin.yml'))[Rails.env]
