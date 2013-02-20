class PhotosController < ApplicationController

  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.build(params[:photo])
    respond_to do |format| 
      if @album.save
        format.html { redirect_to @album, notice: 'Photo was successfully added.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { redirect_to @album }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album = Album.find(params[:album_id])    
    @photo = @album.photos.find_by_id(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to @album }
      format.json { head :no_content }
    end
  end

  
end
