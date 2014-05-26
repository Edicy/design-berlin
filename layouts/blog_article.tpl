<!DOCTYPE html>
<html class="{% if editmode %}editmode{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
</head>
<body{% if editmode %} class="editmode"{% endif %}>
  <div class="wrap-holder">
    <div class="wrap">
      <aside class="sidebar">
          {% include "sidebar" %}
      </aside>
      <main class="main">
        <div class="container-wrap">
          <div class="container">
            {% include "submenu" %}
            
            <header class="post-header">
              <h1>{% editable article.title %} <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%d.%m" }}</time></h1>
            </header>
            
            <section class="post-content">
              <div class="post-excerpt cfx content-formatted">{% editable article.excerpt %}</div>
              <div class="post-body cfx content-formatted">{% editable article.body %}</div>
            </section>
            
            <section class="comments content-formatted">
              {% case article.comments_count %}{% when 0 %}{% else %}<h3 class="comment-title">{{"comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span></h3>{% endcase %}
              
              {% include "comment-form" %}
            
              {% for comment in article.comments reversed %}
                <div class="comment">
                  <div class="comment-body">{{ comment.body }}</div>
                  <div class="comment-info">({{ comment.author }}, {{ comment.created_at | date : "%b %d, %Y" }})</div>
                </div>
              {% endfor %}
            </section>
          </div>
        </div>
      </main>
      {% include "footer" %}
    </div> 
  </div>
  
  {% include "mobilemenu" %}
  {% include "javascripts" %}
</body>
</html>