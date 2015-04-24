class Admin::SectionsController < ApplicationController

  def edit
    @section = Section.find_by_name(params[:section])
  end

  def update
    @section = Section.find_by_name(params[:section])
    @section.data = params[:data]

    if params.has_key? 'save'
      if @section.save
        flash[:success] = "#{@section.name} saved successfully!"
        redirect_to admin_site_path
      else
        render :edit
      end
    else
      @preview = true
      partial = "site/#{@section.name.gsub('-','_')}"
      render partial
    end
  end

end
