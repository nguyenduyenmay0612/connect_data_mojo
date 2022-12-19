package MyApp::Controller::Users;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub list_users {
    my $self = shift;

    my @users = $self->app->{_dbh}->resultset('User')->search({});

    @users = map { { 
        username => $_->username,
        pass => $_->pass,
    } } @users;

    $self -> render(users=> \@users, msg => 'List of users!');
}


1;