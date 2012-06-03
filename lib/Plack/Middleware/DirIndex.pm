package Plack::Middleware::DirIndex;

use parent qw( Plack::Middleware );
use Plack::Util::Accessor qw(dir_index);

=HEAD1 NAME

Plack::Middleware::DirIndex

=HEAD1 SYNOPSIS

  use Plack::Builder;
  use Plack::Middleware::DirIndex;
  use Plack::App::Directory;

  my $app = Plack::App::Directory->new({ root => './htdocs/' })->to_app;

  builder {
        enable "Plack::Middleware::DirIndex", dir_index => 'index.html';
        $app;
  }
  
=HEAD1 DESCRIPTION

If $env->{PATH_INFO} ends with a '/' then we will add the dir_index
value to it (defaults to index.html)

=cut

sub prepare_app {
    my ($self) = @_;

    $self->dir_index('index.html')   unless $self->dir_index;
}

sub call {
    my ( $self, $env ) = @_;

    if($env->{PATH_INFO} =~ m{/$}) {
        $env->{PATH_INFO} .= $self->dir_index();
    }

    return $self->app->($env);
}

1;