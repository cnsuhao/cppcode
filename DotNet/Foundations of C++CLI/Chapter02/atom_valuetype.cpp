using namespace System;
// atom_valuetype.cpp
value class Atom
{
   private:
      array<double>^ pos;  // declare the managed array
      unsigned int atomicNumber;
      unsigned int isotopeNumber;

   public:

       void Initialize()
       {
        Console::WriteLine(atomicNumber);
        Console::WriteLine(isotopeNumber);
        Console::WriteLine(pos);
       }
       // the rest of the class declaration is unchanged
};

void main()
{
   int n_atoms = 50;
   array<Atom>^ atoms = gcnew array<Atom>(n_atoms);

   // Between the array creation and initialization,
   // the atoms are in an invalid state.
   // Don't call GetAtomicNumber here!

   for (int i = 0; i < n_atoms; i++)
   {
       atoms[i].Initialize( /* ... */ );
   }
}
