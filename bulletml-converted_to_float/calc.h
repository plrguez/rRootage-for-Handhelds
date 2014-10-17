#ifndef CALC_H_
#define CALC_H_

#include "formula.h"
#include "bulletmlcommon.h"

#include <string>
#include <memory>

//senquack - complete conversion to floats:
//DECLSPEC std::auto_ptr<Formula<double> > calc(const std::string& str);
DECLSPEC std::auto_ptr < Formula < float >>
calc (const std::string & str);

#endif // CALC_H_
