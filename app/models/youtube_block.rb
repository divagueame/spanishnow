class YoutubeBlock < ApplicationRecord
  has_one :lesson_block, as: :block, dependent: :destroy
  has_one :lesson_group, through: :lesson_block
  accepts_nested_attributes_for :lesson_block

  def embed_code
    youtube_id = youtube_id_extract(self.url)
     
    youtube_code =  "<iframe class='youtube' src='https://www.youtube-nocookie.com/embed/#{youtube_id}' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
  end
end

  def youtube_id_extract(youtube_url)
    regex = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/
    match = regex.match(youtube_url)
    if match && !match[1].blank?
      match[1]
    else
      nil
    end
  end
