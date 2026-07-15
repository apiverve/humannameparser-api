declare module '@apiverve/humannameparser' {
  export interface humannameparserOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface humannameparserResponse {
    status: string;
    error: string | null;
    data: HumanNameParserData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface HumanNameParserData {
      name:       null | string;
      parsed:     Parsed;
      initials:   null | string;
      formalName: null | string;
  }
  
  interface Parsed {
      title:  null | string;
      first:  null | string;
      middle: null | string;
      last:   null | string;
      nick:   null | string;
      suffix: null | string;
  }

  export default class humannameparserWrapper {
    constructor(options: humannameparserOptions);

    execute(callback: (error: any, data: humannameparserResponse | null) => void): Promise<humannameparserResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: humannameparserResponse | null) => void): Promise<humannameparserResponse>;
    execute(query?: Record<string, any>): Promise<humannameparserResponse>;
  }
}
