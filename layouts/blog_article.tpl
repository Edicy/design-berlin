<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
</head>
<body{% if editmode %} class="editmode"{% endif %}>

  <div class="wrap cfx">
    <aside class="sidebar">
      {% include "langmenu" %}
      {% include "topbar" %}
      {% include "sidebar" %}
    </aside>
    <div class="main">
      <div class="inner">
        <div class="container-wrap cfx">
          <div class="container">
            
            <nav class="sub-menu tag-list">
              {% if article.tags.size > 0 %}
              <ul>
                {% for tag in article.tags %}
                <li><a href="/{{ page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
                {% endfor %}
              </ul>
              {% endif %}
            </nav>
            
            
            <header class="post-header">
              <h1>{% editable article.title %} <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%d.%m" }}</time></h1>
            </header>
            <section class="post-content">
              <div class="post-excerpt cfx formatted">{% editable article.excerpt %}</div>
              <div class="post-body cfx formatted">{% editable article.body %}</div>
              
              {% if editmode %}
              <div class="post-tags">
              {% editable article.tags %}
              </div>
              {% endif %}
            </section>
            <section class="comments formatted">
              <h3 class="comment-title">
                {% case article.comments_count %}
                  {% when 0 %}{{ "write_first_comment" | lc }}
                  {% else %}{{"comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span>
                {% endcase %}
              </h3>
              {% include "comment-form" %}
              {% for comment in article.comments reversed %}
                <div class="comment edy-site-blog-comment">
                  <div class="comment-body">{{ comment.body_html }}</div>
                  <div class="comment-info">({{ comment.author }}, {{ comment.created_at | format_date: "long" }}) {% removebutton %}</div>
                </div>
              {% endfor %}
            </section>
          </div>
        </div>
      </div>
    </div>
    {% include "footer" %}
  </div> 
  {% include "mobilemenu" %}
  {% include "javascripts" %}
</body>
</html>