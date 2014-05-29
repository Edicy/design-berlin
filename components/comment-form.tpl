<div class="comment-form{% unless comment.valid? %} form_with_errors{% endunless %}">
  <input class="form_field_textfield form_field_size_large comment-form-focus-input"  type="text" placeholder="{{ "comment" | lc }}" />
  {% commentform %}
    {% assign comment_name_error = false %}
    {% assign comment_email_error = false %}
    {% assign comment_body_error = false %}
    
    {% unless comment.valid? %}
        {% for error in comment.errors %}
            {% if error == "comment_author_blank" %}{% assign comment_name_error = true %}{% endif %}
            {% if error == "comment_email_blank" %}{% assign comment_email_error = true %}{% endif %}
            {% if error == "comment_body_blank" %}{% assign comment_body_error = true %}{% endif %}
        {%endfor %}
    {% endunless %}

    <div class="form_area">
      <div class="form_fields">
        
        <div class="form_field{% if comment_body_error %} form_field_with_errors{% endif %}">
          <textarea id="comment-form-body" class="form_field_textarea form_field_size_large" name="comment[body]" rows="3" placeholder="{{ "comment" | lc }}">{{ comment.body }}</textarea>
        </div>
        <div class="cfx">
          <div class="form_field comment-name-field{% if comment_name_error %} form_field_with_errors{% endif %}">
            <input id="comment-form-name" class="form_field_textfield" name="comment[author]" value="{{ comment.author }}" placeholder="{{ "name" | lc }}">
          </div>

          <div class="form_field comment-email-field{% if comment_email_error %} form_field_with_errors{% endif %}">
            <input id="comment-form-email" class="form_field_textfield" name="comment[author_email]" value="{{ comment.author_email }}" placeholder="{{ "email" | lc }}">
          </div>
        </div>
      </div>
      
      <div class="submit-holder">
        <div class="form_submit">
          <input type="submit" value="{{ "submit" | lc }}">
        </div>
      </div>
    </div>
  {% endcommentform %}
</div>
