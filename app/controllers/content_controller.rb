class ContentController < ApplicationController
  MAX_SIZE = 15_728_640 # 15 megabytes
  ALLOWED_MIME_TYPES = %w{application/x-shockwave-flash audio/mpeg image/png image/jpeg image/gif}

  def view
    if @content = Content.find_by_sid(params[:hash])
      case @content.content_type
      when "image/png", "image/jpeg"
        render :picture
      when "audio/mpeg"
        render :audio
      when "application/x-shockwave-flash"
        render :flash
      end
    else
      render text: "no such picture"
    end
  end

  def new
    if file = params[:file]
      raise "file is too big - max size: #{MAX_SIZE} bytes" if file.size >= MAX_SIZE
      raise "invalid mime type" unless ALLOWED_MIME_TYPES.include? file.content_type
      content = Content.new data: file.read, remote_address: request.remote_ip
      content.sid = Digest::MD5.hexdigest content.data
      content.name = file.original_filename
      content.content_type = file.content_type
      content.save
      render text: "http://io.maero.dk/#{content.sid}\n"
    else
      render text: "the fuck...?"
    end
  rescue Exception
    render text: "error: #{$!}\n"
  end

  def file
    if content = Content.find_by_sid(params[:hash])
      send_data content.data, type: content.content_type, disposition: 'inline', buffer_size: 1024
    else
      render text: "content not found"
    end
  end
end
