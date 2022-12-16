package MyApp;
#use MyApp::Model::DB;
use Mojo::mysql;
use MyApp::Model::DB;
use Mojo::Base 'Mojolicious', -signatures;


# This method will run once at server start
sub startup ($self) {

  $self->_set_db_operation_handler();

  sub _set_db_operation_handler {
    my $self = shift;

    $self->{ _dbh } = MyApp::Model::DB->new();

    return $self;
}

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  $self->secrets($config->{secrets});


  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('Example#welcome');
  $r->get('/user')->to('Example#list_users');

}



1;
