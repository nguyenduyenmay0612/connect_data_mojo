package MyApp::Controller::Example;
use Mojo::Base 'Mojolicious::Controller', -signatures;

# This action will render a template
sub welcome ($self) {

  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}
sub list_books {
    my $self = shift;

    my @users = $self->app->{_dbh}->resultset('User')->search({});

    @users = map { { 
        username => $_->username,
        pass => $_->pass,
    } } @users;

    $self->render(msg => 'List of users!', users/list_users => \@users);
}

1;
