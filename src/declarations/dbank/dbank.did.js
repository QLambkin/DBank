export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'checkBalance' : IDL.Func([], [IDL.Float64], ['query']),
    'compound' : IDL.Func([], [], ['oneway']),
    'setAmount' : IDL.Func([IDL.Float64], [], ['oneway']),
    'topUp' : IDL.Func([IDL.Float64], [], ['oneway']),
    'withdraw' : IDL.Func([IDL.Float64], [], ['oneway']),
  });
};
export const init = ({ IDL }) => { return []; };