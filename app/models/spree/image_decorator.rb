Spree::Image.class_eval do
  mount_uploader :attachment, CloudinaryUploader, :mount_on => :attachment_file_name

  # Get rid of the paperclip callbacks
  def save_attached_files; end
  def prepare_for_destroy; end
  def destroy_attached_files; end
  def validates_attachment; end

  # handle shorthand attachment(:style_name)
  def attachment_with_style(style = nil)
    if style
      attachment_without_style.url(style)
    else
      attachment_without_style
    end
  end
  alias_method_chain :attachment, :style
end
