# {{ (datasource "list").spec.name }}

{{ (datasource "list").spec.description }}

<!-- toc -->
<!-- /toc -->

{{ range $index, $entrytype := (datasource "list").spec.types }}
# Type - {{ $entrytype | strings.Title }}
{{ range $index, $entry := (datasource "list").spec.entries }}
{{- if (eq $entry.type $entrytype) }}
## {{ $entry.name }}

**Category:** {{ $entry.category }}

**Url:** {{ $entry.url }}

**Description:** {{ $entry.description }}
{{- if index $entry "examples" }}
{{ range $index, $example := $entry.examples }}
{{- if eq $index 0 }}
<details><summary>Examples</summary>
{{ end }}
<p>

Example {{ $index }} - {{ $example.name | strings.TrimSpace }}

{{ $example.result }}

```
{{ $example.manifest}}
```
</p>
{{ end }}
</details>
{{ end }}
{{ end }}
{{ end }}
{{ end }}