unless @featured_ads.empty?
  json.ads do
    json.array! @featured_ads do |ad|
      if !ad.pictures.nil? && ad.pictures[0].present?
        pic_url = ad.pictures[0].thumb.url
      else
        pic_url = ''
      end
      json.title ad.title
      json.id ad.id
      json.condition ad.condition
      json.price ad.price
      json.img_url pic_url
    end
  end
else
  json.ads []
end