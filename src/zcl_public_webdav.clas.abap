class ZCL_PUBLIC_WEBDAV definition
  public
  inheriting from CL_HTTP_EXT_WEBDAV_SKWF
  create public .

public section.
  methods crack_skwf_url redefinition.
  methods if_http_extension~handle_request redefinition.
protected section.
private section.
ENDCLASS.



CLASS ZCL_PUBLIC_WEBDAV IMPLEMENTATION.
 method crack_skwf_url.

   split p_url at '/' into table data(parts).
   delete parts from 1 to 2.
   concatenate lines of parts into data(url) in character mode separated by '/'.
   url = '/SAP/PUBLIC/' && url.

   super->crack_skwf_url(
     exporting p_url = url
     importing p_application = p_application
              p_component = p_component
              p_context = p_context
              p_internal_url = p_internal_url
              p_io = p_io ).

 endmethod.

 method if_http_extension~handle_request.
  super->if_http_extension~handle_request( server = server ).
  data(res_text) = server->response->get_cdata( ).
 endmethod.
ENDCLASS.
