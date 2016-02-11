class LollyController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @langlist = Language.where('LANGID > 0')
  end
  def dictList
    dictlist = Dictall.where('LANGID = ?', params[:selectedLangID])
    render json: dictlist
  end
  def dictUrl
    dict = Dictall.where('LANGID = ? AND DICTNAME = ?', params[:selectedLangID], params[:selectedDictName]).first
    render json: {url: dict.URL, status: :ok}.to_json
  end
  def search
    dict = Dictall.where('LANGID = ? AND DICTNAME = ?', params[:selectedLangID], params[:selectedDictName]).first
    url = dict.URL.sub("{0}", URI.encode(params[:word]))
    redirect_to url
  end
end
