package MyApp::Controller::users;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub list_books {
    my $self = shift;

    my @users = $self->app->{_dbh}->resultset('User')->search({});

    @users = map { { 
        username => $_->username,
        pass => $_->pass,
    } } @users;

    $self->render(msg => 'List of users!', users => \@users);
}

1;