class LollyController < ApplicationController
  def index
    @langlist = Language.where('LANGID > 0')
  end
  def dictList
    @dictlist = Dictall.where('LANGID = ?', params[:selectedLangID])

    respond_to do |format|
        format.js { render :layout => false }
    end
  end
  def dictUrl
    
  end
  def search
    
  end
end
