declare module '@apiverve/humannameparser' {
  export interface humannameparserOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface humannameparserResponse {
    status: string;
    error: string | null;
    data: HumanNameParserData;
    code?: number;
  }


  interface HumanNameParserData {
      name:   string;
      parsed: Parsed;
  }
  
  interface Parsed {
      title:  string;
      first:  string;
      middle: string;
      last:   string;
      nick:   string;
      suffix: string;
  }

  export default class humannameparserWrapper {
    constructor(options: humannameparserOptions);

    execute(callback: (error: any, data: humannameparserResponse | null) => void): Promise<humannameparserResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: humannameparserResponse | null) => void): Promise<humannameparserResponse>;
    execute(query?: Record<string, any>): Promise<humannameparserResponse>;
  }
}
