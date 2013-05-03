//
//
// these macros are defined in cxxflags by llvm-config
//#define __STDC_LIMIT_MACROS
//#define __STDC_CONSTANT_MACROS
//

#include <llvm/Config/config.h>
#include <llvm/LLVMContext.h>
#include <llvm/Module.h>
#include <llvm/DerivedTypes.h>
#include <llvm/Constants.h>
#include <llvm/GlobalVariable.h>
#include <llvm/Function.h>
#include <llvm/CallingConv.h>
#include <llvm/BasicBlock.h>
#include <llvm/Instructions.h>
#include <llvm/InlineAsm.h>
#include <llvm/Support/FormattedStream.h>
#include <llvm/Support/MathExtras.h>
#include <llvm/Pass.h>
#include <llvm/PassManager.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/Verifier.h>
#include <llvm/Assembly/PrintModulePass.h>
#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include <llvm/ExecutionEngine/GenericValue.h>
#include <llvm/ExecutionEngine/Interpreter.h>

#include <llvm/Support/TargetSelect.h>

#include <llvm/Attributes.h>

#include <unistd.h>
#include <cstdio>
#include <vector>
#include <algorithm>
using namespace llvm;


Module* makeLLVMModule();
Function* func_factorial;

int main(int argc, char**argv) {
    InitializeNativeTarget();
    Module* Mod = makeLLVMModule();
    verifyModule(*Mod, PrintMessageAction);
    PassManager PM;
    PM.add(createPrintModulePass(&outs()));
    PM.run(*Mod);

    //ExecutionEngine *exe=::llvm::Interpreter::create(Mod);
    ExecutionEngine *exe = EngineBuilder(Mod).create();

    std::vector<GenericValue> args;
    GenericValue GVArgc;
    GVArgc.IntVal = APInt(32, 24);
    args.push_back(GVArgc);
    //printf("xxxx:%p,%p\n",func_factorial,(void*)(&exe->runFunction));
    GenericValue ret=exe->runFunction(func_factorial,args);
    printf("ret=%llu\n",ret.IntVal.getZExtValue());
    exe->freeMachineCodeForFunction(func_factorial);
    delete exe;
    //llvm_shutdown();
    return 0;
}


Module* makeLLVMModule() {
    // Module Construction
    Module* mod = new Module("/tmp/sample1.c", getGlobalContext());
    mod->setDataLayout("e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128");
    mod->setTargetTriple("x86_64-unknown-linux-gnu");

    // Type Definitions
    std::vector<Type*> FuncTy_0_args;
    FuncTy_0_args.push_back(IntegerType::get(mod->getContext(), 32));
    FunctionType* FuncTy_0 = FunctionType::get(
        /*Result=*/IntegerType::get(mod->getContext(), 32),
        /*Params=*/FuncTy_0_args,
        /*isVarArg=*/false);


    // Function Declarations

    func_factorial = mod->getFunction("factorial");
    if (!func_factorial) {
        func_factorial = Function::Create(
            /*Type=*/FuncTy_0,
            /*Linkage=*/GlobalValue::ExternalLinkage,
            /*Name=*/"factorial", mod);
        func_factorial->setCallingConv(CallingConv::C);
    }

#if LLVM_VERSION == 30 || LLVM_VERSION == 31
    AttrListPtr func_factorial_PAL;
    {
        SmallVector<AttributeWithIndex, 4> Attrs;
        AttributeWithIndex PAWI;
        PAWI.Index = 4294967295U; PAWI.Attrs = 0  | Attribute::NoUnwind | Attribute::ReadNone | Attribute::UWTable;
        Attrs.push_back(PAWI);
        func_factorial_PAL = AttrListPtr::get(Attrs.begin(), Attrs.end());

    }
    func_factorial->setAttributes(func_factorial_PAL);
#elif LLVM_VERSION == 32
    AttrListPtr func_factorial_PAL;
    AttrBuilder ab;
    ab.addAttribute(Attributes::NoUnwind);
    ab.addAttribute(Attributes::ReadNone);
    ab.addAttribute(Attributes::UWTable);
    func_factorial_PAL.addAttr(mod->getContext(), 4294967295U, Attributes::get(mod->getContext(), ab));
    func_factorial->setAttributes(func_factorial_PAL);
#else
#error "Bad LLVM Version"
#endif

    // Global Variable Declarations


    // Constant Definitions
    ConstantInt* const_int32_1 = ConstantInt::get(mod->getContext(), APInt(32, StringRef("1"), 10));

    // Global Variable Definitions

    // Function Definitions

    // Function: factorial (func_factorial)
    {
        Function::arg_iterator args = func_factorial->arg_begin();
        Value* int32_x = args++;
        int32_x->setName("x");

        BasicBlock* label_2 = BasicBlock::Create(mod->getContext(), "",func_factorial,0);

        // Block  (label_2)
        BinaryOperator* int32_3 = BinaryOperator::Create(Instruction::Shl, int32_x, const_int32_1, "", label_2);
        ReturnInst::Create(mod->getContext(), int32_3, label_2);

    }

    return mod;
}
