<footer class="footer">
  <div class="footer-inner formatted">
    <div class="cfx">
      {% include "search" %}
      {% xcontent name="footer" %}
    </div>
    <div class="voog-reference">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
  </div>
  {% if page.private? %}
    <div class="signout-btn-pad"></div>
  {% endif %}
</footer>
