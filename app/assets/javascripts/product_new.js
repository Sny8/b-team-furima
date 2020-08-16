$(document).on('turbolinks:load', function() {
  $(function() {
    function buildHTML(count) {
      var html =` <div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <label class="edit_btn">編集</label>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;            
    }

    function setLabel() {
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g,''));
      $('.label-content').css('width', labelWidth);
    }

    $(document).on('change', '.hidden-field', function() {
      setLabel();
      //hidden-fieldのidの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g,'');
      $('.label-box').attr({id: `label-box--${id}`,for: `images_attributes_${id}_image`});
      var file = this.files[0];
      var render = new FileRender();
      Rreader.readAsDataURL(file);
      ReadableStreamReader.onload = function() {
        var image = this.result;
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }

        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        if (count == 10) {
          $('.label-content').hide();
        }

        setLabel();
        if(count < 10) {
          $('.label-box').attr({id: `label-box--${count}`,for: `product_images_aattributes_${count}_image`});
        }
      }
      
    });

    $(document).on('click', '.delete-box', function() {
      var coiunt = $('.preview-box').length;
      setLabel(count);

      var id = $(this).attr('id').replace(/[^0-9]/g,'');
      $(`#preview-box__${id}`).remove();

      $(`#images_attributes_${id}_image`).val("");

      var count = $('.preview-box').length;
      if (count == 9) {
        $('.label-content').show();
      }

      setLabel(count);

      if(id < 10) {

        $('.label-box').attr({id: `label-box--${id}`,for: `images_attributes_${id}_image`});
      }

    });
  });
})