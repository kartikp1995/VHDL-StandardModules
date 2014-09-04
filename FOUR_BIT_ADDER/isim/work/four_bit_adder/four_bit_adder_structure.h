////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_four_bit_adder_four_bit_adder_structure_H
#define H_Work_four_bit_adder_four_bit_adder_structure_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_four_bit_adder_four_bit_adder_structure: public HSim__s6 {
public:

    HSim__s1 SE[6];

    HSim__s1 SA[1];
  char t16;
    Work_four_bit_adder_four_bit_adder_structure(const char * name);
    ~Work_four_bit_adder_four_bit_adder_structure();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_four_bit_adder_four_bit_adder_structure(const char *name);

#endif
