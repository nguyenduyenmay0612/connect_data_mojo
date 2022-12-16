use utf8;
package MyApp::Schema::Result::Student;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Student

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<students>

=cut

__PACKAGE__->table("students");

=head1 ACCESSORS

=head2 id_students

  data_type: 'integer'
  is_nullable: 0

=head2 name_students

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 birthday

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 address

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "id_students",
  { data_type => "integer", is_nullable => 0 },
  "name_students",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "birthday",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "address",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_students>

=back

=cut

__PACKAGE__->set_primary_key("id_students");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2022-12-16 15:20:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oPrr5iK1OKEzmW6+PHW+KQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
