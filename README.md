# NAME

Plack::Middleware::DirIndex - Middleware to use with Plack::App::Directory and the like

# SYNOPSIS

    use Plack::Builder;
    use Plack::App::File;

    my $app = Plack::App::File->new({ root => './htdocs/' })->to_app;

    builder {
          enable "Plack::Middleware::DirIndex", 
                dir_index => 'home.htm', 
                root => './htdocs/';
          $app;
    }
    

# DESCRIPTION

If `$env->{PATH_INFO}` ends with a '`/`' then we will append the `dir_index`
value to it (**defaults to `index.html`**)

# COPYRIGHT & LICENSE

Copyright (c) 2012 Leo Lapworth. All rights reserved.
This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.
