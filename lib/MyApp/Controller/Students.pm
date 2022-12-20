package MyApp::Controller::Students;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub list_students {
    my $self = shift;

    my @students = $self->app->{_dbh}->resultset('Student')->search({});

    @students = map { { 
        id_students => $_->id_students,
        name_students => $_->name_students,
        birthday => $_->birthday,
        email => $_->email,
        address => $_->address,
    } } @students;

    $self -> render(students=>\@students, msg => 'Danh sách lớp học');
}

sub add_students {
    my $self = shift;
   
    $self -> render(template => 'students/add_students', 
            error    => $self->flash('error'),
            message  => $self->flash('message')
    );
}

sub add {
    my $self = shift;

    my $name_students = $self->param('name_students');
    my $birthday = $self->param('birthday');
    my $email = $self->param('email');
    my $address = $self->param('address');

    if (! $name_students || ! $birthday || ! $email || ! $address ) {
        $self->flash(error => 'Tên sinh viên, ngày sinh, email và địa chỉ là các trường không thể thiếu');
        $self->redirect_to('add_students');
    }

    my $dbh = $self->app->{_dbh};
    my $students = $dbh->resultset('Student')->search({name_students => $name_students});

    if (! $students->first) {
        eval {
            $dbh->resultset('Student')->create({
                name_students => $name_students,
                birthday => $birthday,
                email => $email,
                address => $address
            });
        };
            # $self ->  render (template =>'students/add_student',
            # message => 'Thêm sinh viên thành công'
            # );
            $self->flash( message => 'Thêm sinh viên thành công');
            $self->redirect_to('add_students');
    }
        
}

sub edit_students {
    my $self = shift;
    my $id_students = $self->param('id_students');

    #my $data = $self->_Student->find($id_students);
     my $dbh = $self->app->{_dbh};
    my $students = $dbh->resultset('Student')->search({id_students => $id_students});
    if ($students) {
        $self -> render(template => 'students/edit_students', 
            #students =>$data,
            error    => $self->flash('error'),
            message  => $self->flash('message')
    );
    }    
}

sub edit {

    my $self = shift;

}



1;