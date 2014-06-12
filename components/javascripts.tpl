<script src="{{ javascripts_path }}/jquery-1.11.0.min.js"></script>
<script src="{{ javascripts_path }}/main.js"></script>

{% if site.search.enabled %}
<script src="{{ javascripts_path }}/edicy-search.js"></script>
<script src="{{ javascripts_path }}/search.js"></script>
<script>

  $(function() {
    var search = new VoogSearch($('.js-search-form').get(0), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      noResults: 'No results found!'
    });
  });
</script>
{% endif %}

{% unless editmode %}{{ site.analytics }}{% endunless %}