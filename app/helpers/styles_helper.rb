module StylesHelper
  def inline_css(asset_name)
    "<style type='text/css'>#{read_asset_file_content(asset_name)}</style>".html_safe
  end

  protected

  def read_asset_file_content(asset_name)
    if Rails.env.development?
      Rails.application.assets.find_asset(asset_name).to_s
    else
      path = asset_path(asset_name, host: '', protocol: '').tr(':', '')

      File.read(File.join(Rails.root, 'public', path)).to_s
    end
  end

  def header_logo
    #base64_asset_data_uri("logo.jpeg")
    asset_url('logo.jpeg')
  end

  def base64_asset_data_uri(asset)
    File.open("#{Rails.root}/app/assets/images/#{asset}", 'rb') do |img|
      'data:image/png;base64,' + Base64.strict_encode64(img.read)
    end
  end

end